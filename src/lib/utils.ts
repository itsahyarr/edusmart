export const trackClick = (eventName: string, data?: Record<string, unknown>) => {
	console.log('[EduSmart Event]', eventName, data ?? '');
	// TODO: Integrate with Meta Pixel & Google Analytics
	// fbq('track', eventName, data);
	// gtag('event', eventName, data);
};

export const formatPrice = (price: number): string => {
	return `Rp ${price.toLocaleString('id-ID')}`;
};

export const formatDiscount = (original: number, discount: number): number => {
	return Math.round(((original - discount) / original) * 100);
};
